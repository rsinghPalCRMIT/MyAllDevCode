public class AddPrimaryContact implements Queueable {  
  
      
  
    public void execute(QueueableContext qc) {  
  Account acc = new Account(Name='from queuable job');
        Insert acc;  
                FutureClass.myFutureMethod();
                batchAccountUpdate  b = new batchAccountUpdate();
database.executeBatch(b);

  
    }  
  
}