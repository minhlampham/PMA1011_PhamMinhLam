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
@Table(name = "Promotions")
public class Promotion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PromotionID", nullable = false)
    private Integer id;

    @Size(max = 50)
    @NotNull
    @Nationalized
    @Column(name = "PromotionCode", nullable = false, length = 50)
    private String promotionCode;

    @Size(max = 200)
    @NotNull
    @Nationalized
    @Column(name = "PromotionName", nullable = false, length = 200)
    private String promotionName;

    @Size(max = 500)
    @Nationalized
    @Column(name = "Description", length = 500)
    private String description;

    @Size(max = 20)
    @Nationalized
    @Column(name = "DiscountType", length = 20)
    private String discountType;

    @NotNull
    @Column(name = "DiscountValue", nullable = false, precision = 18, scale = 2)
    private BigDecimal discountValue;

    @ColumnDefault("0")
    @Column(name = "MinOrderValue", precision = 18, scale = 2)
    private BigDecimal minOrderValue;

    @Column(name = "MaxDiscountAmount", precision = 18, scale = 2)
    private BigDecimal maxDiscountAmount;

    @Column(name = "UsageLimit")
    private Integer usageLimit;

    @ColumnDefault("0")
    @Column(name = "UsedCount")
    private Integer usedCount;

    @NotNull
    @Column(name = "StartDate", nullable = false)
    private Instant startDate;

    @NotNull
    @Column(name = "EndDate", nullable = false)
    private Instant endDate;

    @ColumnDefault("1")
    @Column(name = "IsActive")
    private Boolean isActive;

    @ColumnDefault("getdate()")
    @Column(name = "CreatedAt")
    private Instant createdAt;

}