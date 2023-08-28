namespace TaleLearnCode.GoingSchemaless.Repository;

internal static partial class CreateModel
{
	internal static void CustomerOrder(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CustomerOrder>(entity =>
		{
			entity.ToTable("CustomerOrder");

			entity.HasComment("Represents customer orders within the ecommerce platform.");

			entity.Property(e => e.CustomerOrderId)
															.HasMaxLength(36)
															.IsUnicode(false)
															.IsFixedLength()
															.HasComment("Identifier of the customer order record.");

			entity.Property(e => e.CompleteDateTime).HasComment("The UTC date/time the customer order was completed.");

			entity.Property(e => e.CustomerAddressId).HasComment("Identifier of the associated customer address.");

			entity.Property(e => e.CustomerId).HasComment("Identifier of the associated customer order.");

			entity.Property(e => e.OrderDateTime)
															.HasDefaultValueSql("(getutcdate())")
															.HasComment("The UTC date/time the customer order was placed.");

			entity.Property(e => e.OrderStatusId)
															.HasDefaultValueSql("((1))")
															.HasComment("Identifier of the associated order status.");

			entity.Property(e => e.ReserveDateTime).HasComment("The UTC date/time inventory was reserved for the customer order.");

			entity.Property(e => e.ShipDateTime).HasComment("The UTC date/time the customer order was shipped.");

			entity.HasOne(d => d.CustomerAddress)
															.WithMany(p => p.CustomerOrders)
															.HasForeignKey(d => d.CustomerAddressId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrder_CustomerAddress");

			entity.HasOne(d => d.Customer)
															.WithMany(p => p.CustomerOrders)
															.HasForeignKey(d => d.CustomerId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrder_Customer");

			entity.HasOne(d => d.OrderStatus)
															.WithMany(p => p.CustomerOrders)
															.HasForeignKey(d => d.OrderStatusId)
															.OnDelete(DeleteBehavior.ClientSetNull)
															.HasConstraintName("fkCustomerOrder_OrderStatus");
		});
	}
}