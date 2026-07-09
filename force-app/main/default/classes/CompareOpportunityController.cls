public class CompareOpportunityController {
    @AuraEnabled
    public static List<Account> getSearchedAccount(String accountName) {
        try{
            String search = '%'+accountName+'%';
        String query = 'SELECT id,Name,Phone,BillingCountry FROM Account WHERE Name LIKE :search order By Name ASC';
        return Database.query(query);
        }catch(Exception ex) {
            System.debug('ex--'+ex.getMessage());
            return new List<account>();
        }
    }

}