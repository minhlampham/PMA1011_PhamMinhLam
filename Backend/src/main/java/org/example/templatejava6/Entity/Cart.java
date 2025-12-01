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
@Table(name = "Carts")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CartID", nullable = false)
    private Integer id;

    @Size(max = 20)
    @NotNull
    @Nationalized
    @Column(name = "CartCode", nullable = false, length = 20)
    private String cartCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "UserID")
    private User userID;

    @ColumnDefault("getdate()")
    @Column(name = "CreatedAt")
    private Instant createdAt;

    @ColumnDefault("getdate()")
    @Column(name = "UpdatedAt")
    private Instant updatedAt;

}