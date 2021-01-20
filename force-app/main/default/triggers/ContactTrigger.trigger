trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
    new ContactTriggerHandlerNew().run();
}