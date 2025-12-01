package org.example.templatejava6.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

@Getter
@Setter
@Entity
@Table(name = "Sizes")
public class Size {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "SizeID", nullable = false)
    private Integer id;

    @jakarta.validation.constraints.Size(max = 10)
    @NotNull
    @Nationalized
    @Column(name = "SizeCode", nullable = false, length = 10)
    private String sizeCode;

    @jakarta.validation.constraints.Size(max = 10)
    @NotNull
    @Nationalized
    @Column(name = "SizeName", nullable = false, length = 10)
    private String sizeName;

    @ColumnDefault("0")
    @Column(name = "SortOrder")
    private Integer sortOrder;

}