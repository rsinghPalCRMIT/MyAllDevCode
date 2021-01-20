public  class CheckWithSharController2 {


    public static List<Teacher__c> allTeacherREcords(){
        List<Teacher__c> tt = [Select Id,Name,OwnerId from Teacher__c];
        return tt;
    }
}