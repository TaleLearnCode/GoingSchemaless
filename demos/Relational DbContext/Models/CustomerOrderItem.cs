﻿#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents an item within a customer order.
/// </summary>
public partial class CustomerOrderItem
{

	/// <summary>
	/// Identifier of the customer order item record.
	/// </summary>
	public int CustomerOrderItemId { get; set; }
	/// <summary>
	/// Identifier of the associated customer order record.
	/// </summary>
	public string CustomerOrderId { get; set; }
	/// <summary>
	/// Identifier of the product being ordered.
	/// </summary>
	public string ProductId { get; set; }
	/// <summary>
	/// The quantity of producting being ordered.
	/// </summary>
	public int Quantity { get; set; }
	/// <summary>
	/// Identifier of the associated order item status.
	/// </summary>
	public int OrderItemStatusId { get; set; }
	/// <summary>
	/// The UTC date/time the item was added to the product.
	/// </summary>
	public DateTime DateTimeAdded { get; set; }
	/// <summary>
	/// The UTC date/time the item was modified.
	/// </summary>
	public DateTime? DateTimeModified { get; set; }

	public virtual CustomerOrder CustomerOrder { get; set; }
	public virtual OrderStatus OrderItemStatus { get; set; }
	public virtual Product Product { get; set; }

}