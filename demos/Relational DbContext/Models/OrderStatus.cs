#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents the status of a customer order.
/// </summary>
public partial class OrderStatus
{

	public OrderStatus()
	{
		CustomerOrderItems = new HashSet<CustomerOrderItem>();
		CustomerOrders = new HashSet<CustomerOrder>();
	}

	/// <summary>
	/// Identifier of the customer order status record.
	/// </summary>
	public int OrderStatusId { get; set; }
	/// <summary>
	/// The name of the customer order status.
	/// </summary>
	public string OrderStatusName { get; set; }

	public virtual ICollection<CustomerOrderItem> CustomerOrderItems { get; set; }
	public virtual ICollection<CustomerOrder> CustomerOrders { get; set; }

}