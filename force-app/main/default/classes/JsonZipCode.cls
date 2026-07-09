public class JsonZipCode {
  public cls_results[] results;
	public class cls_results {
		public cls_geometry geometry;
	}
	public class cls_geometry {
		public cls_location location;
	}
	public class cls_location {
		public  Double lat;	//49.9970054
		public  Double lng;	//20.0514926
	}
	public static JsonZipCode parse(String json){
		System.debug((JsonZipCode) System.JSON.deserialize(json, JsonZipCode.class));
        return (JsonZipCode) System.JSON.deserialize(json, JsonZipCode.class);
        
	}

}