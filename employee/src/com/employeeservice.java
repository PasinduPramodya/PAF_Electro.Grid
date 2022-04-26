package com;
import model.employee;
//For REST Service
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
//For JSON
import com.google.gson.*;
//For XML
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;
@Path("/Employee")

public class employeeservice {
	employee Obj = new employee();
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readItems()
	 {
	 return Obj.readItems();
	 }
	
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertItem(@FormParam("employeePassword") String employeePassword,
	 @FormParam("employeeName") String employeeName,
	 @FormParam("employeePhone") String employeePhone,
	 @FormParam("employeeEmail") String employeeEmail)
	{
	 String output = Obj.insertcustomerdetails(employeePassword,  employeeName, employeePhone, employeeEmail);
	return output;
	}
	
	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateItem(String itemData)
	{
	//Convert the input string to a JSON object
	 JsonObject Object = new JsonParser().parse(itemData).getAsJsonObject();
	//Read the values from the JSON object
	 String employeeID = Object.get("employeeID").getAsString();
	 String employeePassword = Object.get("employeePassword").getAsString();
	 String employeeName = Object.get("employeeName").getAsString();
	 String employeePhone = Object.get("employeePhone").getAsString();
	 String employeeEmail = Object.get("employeeEmail").getAsString();
	 String output = Obj.updatecustomerdetails(employeeID, employeePassword,employeeName,employeePhone,employeeEmail);
	return output;
	}

	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteItem(String itemData)
	{
	//Convert the input string to an XML document
	 Document doc = Jsoup.parse(itemData, "", Parser.xmlParser());

	//Read the value from the element <itemID>
	 String employeeID = doc.select("employeeID").text();
	 String output = Obj.deleteItem(employeeID);
	return output;
	}

	
}
