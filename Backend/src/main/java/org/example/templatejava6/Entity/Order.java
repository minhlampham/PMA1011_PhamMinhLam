package org.example.templatejava6.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.math.BigDecimal;
import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "Orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "OrderID", nullable = false)
    private Integer id;

    @Size(max = 50)
    @NotNull
    @Nationalized
    @Column(name = "OrderCode", nullable = false, length = 50)
    private String orderCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "UserID")
    private User userID;

    @Size(max = 100)
    @NotNull
    @Nationalized
    @Column(name = "RecipientName", nullable = false, length = 100)
    private String recipientName;

    @Size(max = 20)
    @NotNull
    @Nationalized
    @Column(name = "RecipientPhone", nullable = false, length = 20)
    private String recipientPhone;

    @Size(max = 500)
    @NotNull
    @Nationalized
    @Column(name = "ShippingAddress", nullable = false, length = 500)
    private String shippingAddress;

    @NotNull
    @Column(name = "SubTotal", nullable = false, precision = 18, scale = 2)
    private BigDecimal subTotal;

    @ColumnDefault("0")
    @Column(name = "ShippingFee", precision = 18, scale = 2)
    private BigDecimal shippingFee;

    @ColumnDefault("0")
    @Column(name = "DiscountAmount", precision = 18, scale = 2)
    private BigDecimal discountAmount;

    @NotNull
    @Column(name = "TotalAmount", nullable = false, precision = 18, scale = 2)
    private BigDecimal totalAmount;

    @Size(max = 50)
    @Nationalized
    @Column(name = "PaymentMethod", length = 50)
    private String paymentMethod;

    @Size(max = 50)
    @Nationalized
    @ColumnDefault("'Pending'")
    @Column(name = "PaymentStatus", length = 50)
    private String paymentStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PromotionID")
    private Promotion promotionID;

    @Size(max = 500)
    @Nationalized
    @Column(name = "Note", length = 500)
    private String note;

    @ColumnDefault("getdate()")
    @Column(name = "OrderDate")
    private Instant orderDate;

    @Column(name = "CompletedDate")
    private Instant completedDate;

    @Column(name = "CancelledDate")
    private Instant cancelledDate;

    @Size(max = 500)
    @Nationalized
    @Column(name = "CancelReason", length = 500)
    private String cancelReason;

}