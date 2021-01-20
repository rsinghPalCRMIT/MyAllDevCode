/**
 * @name TestDataFactory
 * @description Contains methods to construct and/or validate commonly used records
**/
public with sharing class TestDataFactory {

    /**
     * @name ConstructCollaborationGroup
     * @description
    **/
    public static CollaborationGroup ConstructCollaborationGroup(){
        //ToDo: Ensure this method returns a single Chatter CollaborationGroup
        //    whose Name starts with 'TEST' followed by the INVENTORY_ANNOUNCEMENTS constant
        //    and configured so anyone can join, see and post updates.
        
         CollaborationGroup ChatterGroup = new CollaborationGroup( Name = 'TEST'+ Constants.INVENTORY_ANNOUNCEMENTS,  
                                                                   CollaborationType = 'Public',//CanHaveGuests = true,
                                                                   IsArchived = false,
                                                                   IsAutoArchiveDisabled = true
                                                                 );

        return ChatterGroup;
    }

    /**
     * @name CreateProducts
     * @description Constructs a list of Product2 records for unit tests
    **/
    public static List<Product2> ConstructProducts(Integer cnt){
        //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Product2 records
        //  with all the required fields populated
        //  and IsActive = true
        //  an Initial Inventory set to 10
        //  and iterating through the product family picklist values throughout the list.
        
        List<Product2> prodsToInst = new List<product2>(); 
        Schema.DescribeFieldResult fieldResult =Product2.Family.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

        for(integer i=0;i< cnt;i++)
        {
                product2 p = new product2();
                 p.Name = 'Product Curry-'+ i ;
                 p.IsActive = true;
                 p.Initial_Inventory__c =10;
                 if(i>=4)
                 p.Family = constants.PRODUCT_FAMILY[0].getValue();
                 else if(i<4)
                 p.Family = constants.PRODUCT_FAMILY[i].getValue();
                
                prodsToInst.add(p);
                
        }
        
        
        return prodsToInst;  
    }

    /**
     * @name CreatePricebookEntries
     * @description Constructs a list of PricebookEntry records for unit tests
    **/
    public static List<pricebookEntry> ConstructPricebookEntries(List<Product2> prods){
        //ToDo: Ensure this method returns a corresponding list of PricebookEntries records
        //  related to the provided Products
        //  with all the required fields populated
        //  and IsActive = true
        //  and belonging to the standard Pricebook
           Id pricebookId = constants.STANDARD_PRICEBOOK_ID;//Test.getStandardPricebookId();
          List<pricebookEntry> PBEntryToInst = new List<pricebookEntry>(); 
          
        for( integer i=0 ;i < prods.size();i++){
          pricebookEntry pbe = new pricebookEntry ( Product2Id = prods[i].Id , PriceBook2Id = pricebookId,
                                                    IsActive = true , UnitPrice = 10
                                                   );
          PBEntryToInst.add(pbe);
        }
         
          
          return PBEntryToInst;                                         

    }

    /**
     * @name CreateAccounts
     * @description Constructs a list of Account records for unit tests
    **/
    public static List<Account> ConstructAccounts(Integer cnt){
        //ToDo: Ensure this method returns a list of size cnt of uniquely named Account records
        //  with all of the required fields populated.
        List<Account> AccListToInst = new List<Account>();
        
        
        for(integer i=0;i< cnt;i++) {
        
          Account acc = new Account ( Name = 'TestAcco' + i);
          AccListToInst.add(acc);
        }
        
        
        return AccListToInst;
        
    }

    /**
     * @name CreateContacts
     * @description Constructs a list of Contacxt records for unit tests
    **/
    public static List<Contact> ConstructContacts(Integer cnt, List<Account> accts){
        //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Contact records
        //  related to the provided Accounts
        //  with all of the required fields populated.
        List<Contact> ConListToInst = new List<Contact>();
        
        
        for(integer i=0;i< cnt;i++) {
             Contact con = new Contact ( LastName = 'TestCont' + i , AccountId = accts[i].Id);
             ConListToInst.add(con);
        }
        
        
        return ConListToInst;
        
    }

    /**
     * @name CreateOrders
     * @description Constructs a list of Order records for unit tests
    **/
    public static List<Order> ConstructOrders(Integer cnt, List<Account> accts){
        //ToDo: Ensure this method returns a list of size cnt of uniquely named Order records
        //  related to the provided Accounts
        //  with all of the required fields populated.
        
        List<Order> OrdListToInst = new List<Order>();
        //Id PricebookId = [SELECT Id From Pricebook2 WHERE IsStandard = true].Id
        Id pricebookId = constants.STANDARD_PRICEBOOK_ID;//Test.getStandardPricebookId();

        for(integer i=0;i< cnt;i++) {
             Order o = new Order ( EffectiveDate = Date.Today() , AccountId = accts[i].Id, Status = 'Draft',Pricebook2Id = pricebookId);
             OrdListToInst.add(o);
        }
        
        
        return OrdListToInst;
        
    }

    /**
     * @name CreateOrderItems
     * @description Constructs a list of OrderItem records for unit tests
    **/
    public static List<OrderItem> ConstructOrderItems(integer cnt, list<pricebookentry> pbes, list<order> ords){
        //ToDo: Ensure this method returns a list of size cnt of OrderItem records
        //  related to the provided Pricebook Entries
        //  and related to the provided Orders
        //  with all of the required fields populated.
        //  Hint: Use the DEFAULT_ROWS constant for Quantity as it will be used in the next challenge
        
        List<OrderItem> OrderItemListToInst = new List<OrderItem>();
        
       for(integer i=0;i< cnt;i++) {
            OrderItem oi = new OrderItem (Quantity = Constants.DEFAULT_ROWS, UnitPrice = 10,
                                          orderId = ords[i].Id, pricebookentryId = pbes[i].Id);
           OrderItemListToInst.add(oi);                               
        }  
          
        return OrderItemListToInst;
    }

    /**
     * @name SetupTestData
     * @description Inserts accounts, contacts, Products, PricebookEntries, Orders, and OrderItems.
    **/
    public static void InsertTestData(Integer cnt){
        //ToDo: Ensure this method calls each of the construct methods
        //  and inserts the results for use as test data.
        
        CollaborationGroup cg = ConstructCollaborationGroup();
        insert cg;
        List<Account> accountList = ConstructAccounts(cnt);
        insert accountList;
        List<Contact> contactList = ConstructContacts(cnt, accountList);
        insert contactList ;
        List<Product2> prodList = ConstructProducts(cnt);
        insert prodList ;
        List<PriceBookEntry> pbeEntry = ConstructPricebookEntries(prodList);
        insert pbeEntry ;
        List<Order> orderList = ConstructOrders(cnt, accountList);
        insert orderList ;
        List<OrderItem> itemList = ConstructOrderItems(cnt, pbeEntry , orderList);
        insert itemList ;

    }
    
     /**
     * @name VerifyQuantityOrdered
     * @description
    **/
    
       public static void VerifyQuantityOrdered(Product2 originalProduct, Product2 updatedProduct, Integer qtyOrdered){
       
         System.assertEquals(originalProduct.Quantity_Ordered__c + qtyOrdered , updatedProduct.Quantity_Ordered__c,'QuantityOrdered mismatch after update' );
       
       }

}