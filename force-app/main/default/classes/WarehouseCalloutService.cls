public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    @future(callout = true)
    public static void runWarehouseEquipmentSync() {
        //ToDo: complete this method to make the callout (using @future) to the
        //      REST endpoint and update equipment on hand.
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(WAREHOUSE_URL);
        req.setMethod('GET');
        
        HttpResponse res = h.send(req);
        
        System.debug('Respose recieved is : ' + res);
        System.debug('Response status code : ' + res.getStatusCode());
        
        if(res.getStatusCode()==200)
        {
            System.debug('Respose recieved is : ' + res);
            List<Object> equipments = (List<Object>) JSON.deserializeUntyped(res.getBody());
            List<Product2> productList=new List<Product2>();
            
            for(Object obj : equipments)
            {
                Map<String, Object> productMap = (Map<String, Object>) obj;
                Product2 product=new Product2();
                
                product.Name = (String)productMap.get('name');
                product.Cost__c = (Integer)productMap.get('cost');
                product.Warehouse_SKU__c = (String)productMap.get('sku');
                product.ProductCode = (String)productMap.get('_id');
                product.Replacement_Part__c = (Boolean)productMap.get('replacement');
                product.Lifespan_Months__c = (Integer)productMap.get('lifespan');
                product.Current_Inventory__c = (Integer)productMap.get('quantity');
                product.Maintenance_Cycle__c = (Integer)productMap.get('maintenanceperiod');
                
                productList.add(product);                              
                
            }
            
            upsert productList;
            
        }
                
    }
}