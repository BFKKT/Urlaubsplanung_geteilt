
var context = SP.ClientContext.get_current();
var web = context.get_web();

//Funktion zum Speichern eines Elements in der Urlaubsliste
function saveItem() {
    //Referenz zur Urlaubsliste holen
    var getlist = web.get_lists().getByTitle("Urlaubsliste");

    //Element erstellen
    var newItem = getlist.addItem(new SP.ListItemCreationInformation());
    newItem.set_item('Title', $("#inTitle").val());
    newItem.set_item('Name_Urlaub', $("#inName").val());
    newItem.set_item('Vorname_Urlaub', $("#inVorname").val());
    newItem.set_item('Von_Urlaub', $("#inVon").val());
    newItem.set_item('Bis_Urlaub', $("#inBis").val());
    newItem.set_item('Bemerkungen_Urlaub', $("#inBemerkung").val());
    newItem.update();

    //Abfrage ausführen
    context.executeQueryAsync(saveOK, saveErr);
}

function saveOK() {
    $("#inTitle").val("");
    $("#inName").val("");
    $("#inVorname").val("");
    $("#inVon").val("");
    $("#inBis").val("");
    $("#inBemerkung").val("");
    alert('Daten wurden erfolgreich gespeichert!');
}

function saveErr(sender, args) {
    alert('Fehler: ' + args.get_message());
}
