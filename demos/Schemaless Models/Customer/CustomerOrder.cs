namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class CustomerOrder : ModelBase
{

	[JsonProperty("shippingAddress")]
	public CustomerAddressComponent ShippingAddress { get; set; }

	[JsonProperty("orderStatusId")]
	public string OrderStatusId { get; set; } = null!;

	[JsonProperty("orderStatus")]
	public string OrderStatus { get; set; } = null!;

	[JsonProperty("orderDateTime")]
	public DateTime OrderDateTime { get; set; }

	[JsonProperty("ReservedDateTime")]
	public DateTime? ReservedDateTime { get; set; }

	[JsonProperty("shipDateTime")]
	public DateTime? ShipDateTime { get; set; }

	[JsonProperty("completeDateTime")]
	public DateTime? CompleteDateTime { get; set; }

	[JsonProperty("orderItems")]
	public List<CustomerOrderItemDetail>? OrderItems { get; set; }

}