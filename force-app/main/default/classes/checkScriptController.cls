public class checkScriptController {

    public static string varConA{get;set;}
    public static boolean boolResponse{get;set;}
    
    public checkScriptController (){
        varConA= 'Hello1';

    }
    
    public static void showInfor(){
        varConA= 'Hello1 buttton';
    }
    
    
    @RemoteAction
    public static boolean verify (string response) {
        System.debug('@@@@@  >>>' + response);
           
           if(string.isNotBlank(response)){
               boolResponse= true;
               System.debug('@@boolResponse @@  >>>' + boolResponse );

           }
        // //
        return true;
    } 
    
}