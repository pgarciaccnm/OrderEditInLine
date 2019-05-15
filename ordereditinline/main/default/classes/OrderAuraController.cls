public class OrderAuraController {
    
    @AuraEnabled
    public static List<Order> getOrders(Id caseId){
        
        return [select id, OrderNumber, Status, TotalAmount, Shipping_Track_Number__c,  (select id, OrderItemNumber, Product2Id, Product2.name, Product2.family from OrderItems)  orderProductItems from order where Case_Id__c =: caseId];        

    } 
    
    /**
     * This is request by Order Trigger (Before Update)
     * If the order.ShippingTrackNumber is null && Status become in Processed return error
     * else return null
     * */
    public static String hasTrackingNumber(Order ord){
        
        if(ord.Status != 'Processed') return null;
        
        Order inOrder = [Select id, Status, Shipping_Track_Number__c,(select id, OrderItemNumber, Product2Id, Product2.name, Product2.family from OrderItems) from Order where Id =: ord.Id];
        
        String errorLabel = 'The Order Status can not be Processed until the Trackin Number is entered.';
        

        for(OrderItem oi : inOrder.OrderItems){

           if(	oi.Product2.Name.contains ('Express')  && 
          		String.isEmpty(ord.Shipping_Track_Number__c)) {
                  
                  return errorLabel;
              }           
        }
        
        
        return null;
    }
       
    
    @AuraEnabled
    public static List<Order> fetchOrder(Id caseId){

       return (List<Order>) [Select id, case_id__c, ordernumber, status, Shipping_Track_Number__c, Shipping_Institution__c, Shipping_Attention__c, TotalAmount, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, (select id, OrderItemNumber, Product2Id, Product2.name, Product2.family from OrderItems)  orderProductItems from Order where case_id__c = :caseId];
         
    }

}