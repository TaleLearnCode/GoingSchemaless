namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class Customer : ModelBase
{

	[JsonProperty("firstName")]
	public string? FirstName { get; set; }

	[JsonProperty("lastName")]
	public string LastName { get; set; } = null!;

	[JsonProperty("emailAddress")]
	public string EmailAddress { get; set; } = null!;

	[JsonProperty("primaryAddress")]
	public CustomerAddressComponent PrimaryAddress { get; set; } = null!;

	[JsonProperty("addresses")]
	public List<CustomerAddressComponent> Addresses { get; set; } = new();

	[JsonProperty("recentOrders")]
	public List<CustomerOrderComponent> RecentOrders { get; set; } = null!;

}