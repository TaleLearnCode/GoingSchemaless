﻿#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents customer orders within the ecommerce platform.
/// </summary>
public partial class CustomerOrder
{

	public CustomerOrder()
	{
		CustomerOrderItems = new HashSet<CustomerOrderItem>();
	}

	/// <summary>
	/// Identifier of the customer order record.
	/// </summary>
	public string CustomerOrderId { get; set; }
	/// <summary>
	/// Identifier of the associated customer order.
	/// </summary>
	public int CustomerId { get; set; }
	/// <summary>
	/// Identifier of the associated customer address.
	/// </summary>
	public int CustomerAddressId { get; set; }
	/// <summary>
	/// Identifier of the associated order status.
	/// </summary>
	public int OrderStatusId { get; set; }
	/// <summary>
	/// The UTC date/time the customer order was placed.
	/// </summary>
	public DateTime OrderDateTime { get; set; }
	/// <summary>
	/// The UTC date/time inventory was reserved for the customer order.
	/// </summary>
	public DateTime? ReserveDateTime { get; set; }
	/// <summary>
	/// The UTC date/time the customer order was shipped.
	/// </summary>
	public DateTime? ShipDateTime { get; set; }
	/// <summary>
	/// The UTC date/time the customer order was completed.
	/// </summary>
	public DateTime? CompleteDateTime { get; set; }

	public virtual Customer Customer { get; set; }
	public virtual CustomerAddress CustomerAddress { get; set; }
	public virtual OrderStatus OrderStatus { get; set; }
	public virtual ICollection<CustomerOrderItem> CustomerOrderItems { get; set; }

}