package org.example.templatejava6.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "ProductReviews")
public class ProductReview {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ReviewID", nullable = false)
    private Integer id;

    @Size(max = 20)
    @NotNull
    @Nationalized
    @Column(name = "ReviewCode", nullable = false, length = 20)
    private String reviewCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "UserID")
    private User userID;

    @Column(name = "Rating")
    private Integer rating;

    @Size(max = 1000)
    @Nationalized
    @Column(name = "Comment", length = 1000)
    private String comment;

    @ColumnDefault("0")
    @Column(name = "IsVerifiedPurchase")
    private Boolean isVerifiedPurchase;

    @ColumnDefault("0")
    @Column(name = "IsApproved")
    private Boolean isApproved;

    @ColumnDefault("getdate()")
    @Column(name = "CreatedAt")
    private Instant createdAt;

    @ColumnDefault("getdate()")
    @Column(name = "UpdatedAt")
    private Instant updatedAt;

}