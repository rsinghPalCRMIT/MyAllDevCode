trigger InsertCase on Case (before insert) {

InsertCaseController.InsertCaseBasedOnEmail(Trigger.New);
}