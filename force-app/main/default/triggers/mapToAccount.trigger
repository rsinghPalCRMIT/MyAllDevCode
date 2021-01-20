trigger mapToAccount on Case (before insert) {

   checkAccountMap.mapAccoutWithCase(Trigger.New);

}