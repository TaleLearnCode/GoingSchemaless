namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class CustomerOrderComponent : ComponentBase
{

	[JsonProperty("orderStatusId")]
	public string OrderStatusId { get; set; } = null!;

	[JsonProperty("orderStatus")]
	public string OrderStatus { get; set; } = null!;

	[JsonProperty("orderStatusDate")]
	public DateTime OrderStatusDate { get; set; }

	[JsonProperty("orderItems")]
	public List<CustomerOrderItemComponent>? OrderItems { get; set; }

}