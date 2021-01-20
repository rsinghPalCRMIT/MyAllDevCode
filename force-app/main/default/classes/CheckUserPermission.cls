public class CheckUserPermission {

    @AuraEnabled
    public static boolean methodName(Id CurrentRecordId){
        Boolean Showmsg;
        UserRecordAccess u = [SELECT RecordId FROM UserRecordAccess WHERE UserId=:userinfo.getuserid() AND HasEditAccess = true AND RecordId =:CurrentRecordId limit 1];
        if(u == Null){
            Showmsg = false;
        }else{
            Showmsg=true;
        }
        return Showmsg;
    }
    @AuraEnabled
    public static void setAttribute(String myString) {
      System.debug(myString);
    }
}