public class fromJSONForLastReply{
	public String last_reply;	//test
	public  fromJSONForLastReply parse(String json){
		return (fromJSONForLastReply) System.JSON.deserialize(json, fromJSONForLastReply.class);
	}
}