namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void CustomerOrderItem(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CustomerOrderItem>(entity =>
		{
			entity.ToTable("CustomerOrderItem");

			entity.HasComment("Represents an item within a customer order.");

			entity.Property(e => e.CustomerOrderItemId).HasComment("Identifier of the customer order item record.");

			entity.Property(e => e.CustomerOrderId)
															.IsRequired()
															.HasMaxLength(36)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the associated customer order record.");

			entity.Property(e => e.DateTimeAdded)
															.HasDefaultValueSql("(getutcdate())")
															.HasComment("The UTC date/time the item was added to the product.");

			entity.Property(e => e.DateTimeModified).HasComment("The UTC date/time the item was modified.");

			entity.Property(e => e.OrderItemStatusId)
															.HasDefaultValueSql("((1))")
															.HasComment("Identifier of the associated order item status.");

			entity.Property(e => e.ProductId)
															.IsRequired()
															.HasMaxLength(5)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the product being ordered.");

			entity.Property(e => e.Quantity).HasComment("The quantity of producting being ordered.");

			entity.HasOne(d => d.CustomerOrder)
															.WithMany(p => p.CustomerOrderItems)
															.HasForeignKey(d => d.CustomerOrderId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrderItem_CustomerOrder");

			entity.HasOne(d => d.OrderItemStatus)
															.WithMany(p => p.CustomerOrderItems)
															.HasForeignKey(d => d.OrderItemStatusId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrderItem_OrderStatus");

			entity.HasOne(d => d.Product)
															.WithMany(p => p.CustomerOrderItems)
															.HasForeignKey(d => d.ProductId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrderItem_Product");
		});
	}
}