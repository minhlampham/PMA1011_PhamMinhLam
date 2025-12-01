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
@Table(name = "ProductImages")
public class ProductImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ImageID", nullable = false)
    private Integer id;

    @Size(max = 30)
    @NotNull
    @Nationalized
    @Column(name = "ImageCode", nullable = false, length = 30)
    private String imageCode;

    @Size(max = 500)
    @NotNull
    @Nationalized
    @Column(name = "ImageURL", nullable = false, length = 500)
    private String imageURL;

    @ColumnDefault("0")
    @Column(name = "IsPrimary")
    private Boolean isPrimary;

    @ColumnDefault("0")
    @Column(name = "SortOrder")
    private Integer sortOrder;

    @ColumnDefault("getdate()")
    @Column(name = "CreatedAt")
    private Instant createdAt;

}