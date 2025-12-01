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
@Table(name = "ShippingAddresses")
public class ShippingAddress {
    @Id
    @Column(name = "AddressID", nullable = false)
    private Integer id;

    @Size(max = 20)
    @NotNull
    @Nationalized
    @Column(name = "AddressCode", nullable = false, length = 20)
    private String addressCode;

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
    @Column(name = "Phone", nullable = false, length = 20)
    private String phone;

    @Size(max = 255)
    @NotNull
    @Nationalized
    @Column(name = "AddressLine", nullable = false)
    private String addressLine;

    @Size(max = 100)
    @Nationalized
    @Column(name = "Ward", length = 100)
    private String ward;

    @Size(max = 100)
    @Nationalized
    @Column(name = "District", length = 100)
    private String district;

    @Size(max = 100)
    @NotNull
    @Nationalized
    @Column(name = "City", nullable = false, length = 100)
    private String city;

    @ColumnDefault("0")
    @Column(name = "IsDefault")
    private Boolean isDefault;

    @ColumnDefault("getdate()")
    @Column(name = "CreatedAt")
    private Instant createdAt;

}