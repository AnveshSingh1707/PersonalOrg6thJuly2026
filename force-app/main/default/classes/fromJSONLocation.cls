public class fromJSONLocation{
	public cls_results[] results;
	public class cls_results {			
		public cls_geometry geometry;
	}
	public class cls_geometry {
		public cls_location location;
	}
	public class cls_location {
		public Double lat;	//49.9970054
		public Double lng;	//20.0514926
	}
	
	public static fromJSONLocation parse(String json){
		return (fromJSONLocation) System.JSON.deserialize(json, fromJSONLocation.class);
	}
}