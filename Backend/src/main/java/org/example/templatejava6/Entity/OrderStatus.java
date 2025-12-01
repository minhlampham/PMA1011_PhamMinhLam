package org.example.templatejava6.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

@Getter
@Setter
@Entity
@Table(name = "OrderStatuses")
public class OrderStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "StatusID", nullable = false)
    private Integer id;

    @Size(max = 20)
    @NotNull
    @Nationalized
    @Column(name = "StatusCode", nullable = false, length = 20)
    private String statusCode;

    @Size(max = 50)
    @NotNull
    @Nationalized
    @Column(name = "StatusName", nullable = false, length = 50)
    private String statusName;

    @Size(max = 200)
    @Nationalized
    @Column(name = "Description", length = 200)
    private String description;

    @ColumnDefault("0")
    @Column(name = "SortOrder")
    private Integer sortOrder;

}