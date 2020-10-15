'use strict';

var context = SP.ClientContext.get_current(); // aktuellen Context holen
var web = context.get_web(); //-> Zugriff auf unser AppWeb
var listItems;
var col;
// Dieser Code wird ausgeführt, wenn das DOM bereit ist. Es wird ein Kontextobjekt erstellt, das zur Verwendung des SharePoint-Objektmodells erforderlich ist.
$(document).ready(function () {
    getListItems();
});

//holen der Urlaubselemente
function getListItems() {
    var list = web.get_lists().getByTitle("Urlaubsliste");
    var camlString =
        "<View><ViewFields>" +
        "<FieldRef Name='Title' />" +
        "<FieldRef Name='Name_Urlaub' />" +
        "<FieldRef Name='Vorname_Urlaub' />" +
        "<FieldRef Name='Von_Urlaub' />" +
        "<FieldRef Name='Bis_Urlaub' />" +
        "<FieldRef Name='Bemerkungen_Urlaub' />" +
        "<FieldRef Name='Genehmigungsstatus_Urlaub' />" +
        "</ViewFields></View>";

    var camlQuery = new SP.CamlQuery();

    camlQuery.set_viewXml(camlString);
    listItems = list.getItems(camlQuery);

    context.load(listItems, "Include(Title,Name_Urlaub,Vorname_Urlaub,Von_Urlaub,Bis_Urlaub,Bemerkungen_Urlaub,Genehmigungsstatus_Urlaub)");
    context.executeQueryAsync(getListItemsOK, getListItemsError);
}

// Diese Funktion wird ausgeführt, wenn der obige Aufruf erfolgreich ist.
function getListItemsOK() {
    var unsereDaten = new Array();
    var enumerator = listItems.getEnumerator();
    var enumerator2 = listItems.getEnumerator();
    var aktuelleListe = new Array();
    while (enumerator.moveNext()) {
        var curItem = enumerator.get_current();
        var dataObject = new Object();
        //Prüfung, ob Wete bereits in Liste
        if ($.inArray(curItem.get_item("Name_Urlaub"), aktuelleListe) == -1) {
            aktuelleListe.push(curItem.get_item("Name_Urlaub"));
            dataObject = { name: curItem.get_item("Name_Urlaub"), desc: curItem.get_item("Vorname_Urlaub"), values: [] };
            unsereDaten.push(dataObject);
        }


    }

    while (enumerator2.moveNext()) {
        var curItem = enumerator2.get_current();
        var werte = new Object();

        for (var i = 0; i < unsereDaten.length; i++) {

            if (unsereDaten[i].name == curItem.get_item("Name_Urlaub")) {
                var cssStyle;
                if (curItem.get_item("Genehmigungsstatus_Urlaub") == "Ausstehend") {
                    cssStyle = "ganttOrange";
                } else if (curItem.get_item("Genehmigungsstatus_Urlaub") == "Genehmigt") {

                    cssStyle = "ganttGreen";
                } else {
                    cssStyle = "ganttRed";
                }
                werte = {
                    from: new Date(curItem.get_item("Von_Urlaub")).getTime(),
                    to: new Date(curItem.get_item("Bis_Urlaub")).getTime(),
                    label: curItem.get_item("Title"),
                    desc: curItem.get_item("Bemerkungen_Urlaub"),
                    customClass: cssStyle
                };
                unsereDaten[i].values.push(werte);
            }
        }


    }

    var daten = unsereDaten;

    renderGantt(unsereDaten);
}

// Diese Funktion wird ausgeführt, wenn der obige Aufruf fehlschlägt.
function getListItemsError(sender, args) {
    alert('Fehler:' + args.get_message());
}

function getMyDate(d) {

    var curr_date = d.getDate();

    var curr_month = d.getMonth();

    var curr_year = d.getFullYear();

    curr_year = curr_year.toString().substr(2, 2);



    return curr_date + "." + curr_month + "." + curr_year;
}

function renderGantt(data) {

    if (data.length != 0) {
        $(".gantt").gantt({
            source: data,
            navigate: "scroll",
            maxScale: "months",
            minScale: "days",
            waitText: "Bitte warten...",
            months: ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"],
            itemsPerPage: 10,
            dow: ["S", "M", "D", "M", "Do", "F", "S"],
            onItemClick: function (data) {
                alert("Details");
            },
            onAddClick: function (dt, rowId) {
                alert("Leerer Bereich.");
            },
            onRender: function () {
                if (window.console && typeof console.log === "function") {
                    console.log("chart rendered");
                }
            }
        });
    }



}