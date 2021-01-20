public class ConExtensions {

 private ApexPages.StandardSetController setController;
    public ConExtensions(ApexPages.StandardSetController setController) {
          this.setController = setController;
    }


     public void doSomethingWithMultipleRecords() {
        List<SObject> records = setController.getSelected();

        for(SObject record : records) {
            record.put('Phonr', '9876543234');
        }

        update records;
    }


}