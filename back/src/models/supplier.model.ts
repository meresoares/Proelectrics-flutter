// src/models/supplier.model.ts
import { Model, DataTypes } from 'sequelize';
import sequelize  from '../config/mysql';

class Supplier extends Model {
  public SupplierID!: number;
  public PersonID!: number;
  public Company!: string;
  public ProductType!: string;
  public Rating!: number;
}

Supplier.init(
  {
    SupplierID: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    PersonID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Person',
        key: 'PersonID'
      }
    },
    Company: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    ProductType: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    Rating: {
      type: DataTypes.INTEGER,
      allowNull: true,
    }
  },
  {
    sequelize,
    modelName: 'Supplier',
    tableName: 'Supplier',
    timestamps: false
  }
);

export default Supplier;
