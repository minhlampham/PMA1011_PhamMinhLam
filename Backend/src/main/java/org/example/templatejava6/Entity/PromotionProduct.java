package org.example.templatejava6.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "PromotionProducts")
public class PromotionProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PromotionProductID", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PromotionID")
    private Promotion promotionID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ProductID")
    private Product productID;

}