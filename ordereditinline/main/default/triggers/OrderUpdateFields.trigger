trigger OrderUpdateFields on Order (before update, before insert, after insert, after update) {
    
    if(Trigger.isBefore && Trigger.isUpdate){
        
        if(Trigger.New.size() == 1){
            String hasTrackingNumber = OrderAuraController.hasTrackingNumber(Trigger.New[0]);
            System.debug('aaa'+hasTrackingNumber);
            If(!String.isEmpty(hasTrackingNumber)){
                
                Trigger.New[0].Status.addError(hasTrackingNumber);
            }
        }
        
    }

    
}