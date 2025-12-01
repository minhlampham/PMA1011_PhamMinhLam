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
@Table(name = "ProductVariants")
public class ProductVariant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "VariantID", nullable = false)
    private Integer id;

    @Size(max = 30)
    @NotNull
    @Nationalized
    @Column(name = "VariantCode", nullable = false, length = 30)
    private String variantCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ColorID")
    private Color colorID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SizeID")
    private org.example.templatejava6.Entity.Size sizeID;

    @Size(max = 50)
    @Nationalized
    @Column(name = "SKU", length = 50)
    private String sku;

    @ColumnDefault("0")
    @Column(name = "StockQuantity")
    private Integer stockQuantity;

    @Column(name = "Price", precision = 18, scale = 2)
    private BigDecimal price;

    @ColumnDefault("1")
    @Column(name = "IsActive")
    private Boolean isActive;

    @ColumnDefault("getdate()")
    @Column(name = "CreatedAt")
    private Instant createdAt;

}