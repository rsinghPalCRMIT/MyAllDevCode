public with sharing class CheckWithSharController {

    

List<Teacher__c> teacherInfor{get;set;}

public List<Teacher__c> getshowRec(){
    
   teacherInfor = CheckWithSharController2.allTeacherREcords();
   return teacherInfor;
} 
}