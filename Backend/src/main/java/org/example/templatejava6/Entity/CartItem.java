package org.example.templatejava6.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "CartItems")
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CartItemID", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CartID")
    private Cart cartID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "VariantID")
    private ProductVariant variantID;

    @NotNull
    @Column(name = "Quantity", nullable = false)
    private Integer quantity;

    @ColumnDefault("getdate()")
    @Column(name = "AddedAt")
    private Instant addedAt;

}