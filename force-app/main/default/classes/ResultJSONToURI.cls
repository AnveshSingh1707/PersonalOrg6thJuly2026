public class ResultJSONToURI {
    public jsonTOURI attributes {get;set;}
    public static void attri(){
    String jsonStr = '{"attributes": {"contact_firstname":"A","contact_surname":"c","company_name":"bikaner","prospect_type_id":"1","prospect_status_id":"14"}}';
        ResultJSONToURI rs = (ResultJSONToURI)JSON.deserializeStrict(jsonStr, ResultJSONToURI.class);
        System.debug('JSON ##'+jsonStr);
        System.debug('RESULT ##'+rs);
        System.debug('EncodeURL ##'+rs.attributes.getEncodedURL());
        }
    
}