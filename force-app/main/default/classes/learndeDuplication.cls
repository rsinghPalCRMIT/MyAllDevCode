public class learndeDuplication{


        public static void avoideDuplication(List<Operator__c> lstOperator){
         
            for(Operator__c obj: [Select id, City__c, Country__c, State__c, name from Operator__c]){
                
                for(Operator__c objNew : lstOperator){
                    
                    if(objNew.id != obj.id && obj.City__c == objNew.City__c && obj.Country__c == objNew.Country__c && obj.State__c == objNew.State__c){
                        
                        objNew.adderror('Test');
                    }
                }
            }
        }
}