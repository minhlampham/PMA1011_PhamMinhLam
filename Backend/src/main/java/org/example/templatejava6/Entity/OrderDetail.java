package org.example.templatejava6.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "OrderDetails")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "OrderDetailID", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "OrderID")
    private Order orderID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "VariantID")
    private ProductVariant variantID;

    @Size(max = 200)
    @NotNull
    @Nationalized
    @Column(name = "ProductName", nullable = false, length = 200)
    private String productName;

    @Size(max = 50)
    @Nationalized
    @Column(name = "ColorName", length = 50)
    private String colorName;

    @Size(max = 10)
    @Nationalized
    @Column(name = "SizeName", length = 10)
    private String sizeName;

    @NotNull
    @Column(name = "Quantity", nullable = false)
    private Integer quantity;

    @NotNull
    @Column(name = "UnitPrice", nullable = false, precision = 18, scale = 2)
    private BigDecimal unitPrice;

    @NotNull
    @Column(name = "Subtotal", nullable = false, precision = 18, scale = 2)
    private BigDecimal subtotal;

}