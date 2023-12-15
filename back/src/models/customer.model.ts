// src/models/customer.model.ts
import { Model, DataTypes } from 'sequelize';
import sequelize  from '../config/mysql';

class Customer extends Model {
  public CustomerID!: number;
  public PersonID!: number;
  public PurchaseHistory!: string;
  public Preferences!: string;
}

Customer.init(
  {
    CustomerID: {
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
    PurchaseHistory: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    Preferences: {
      type: DataTypes.TEXT,
      allowNull: true,
    }
  },
  {
    sequelize,
    modelName: 'Customer',
    tableName: 'Customer',
    timestamps: false
  }
);

export default Customer;
