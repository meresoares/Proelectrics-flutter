// src/models/person.model.ts
import { Model, DataTypes } from 'sequelize';
import sequelize  from '../config/mysql';

class Person extends Model {
  public PersonID!: number;
  public FirstName!: string;
  public LastName!: string;
  public Address!: string;
  public Phone!: string;
  public Email!: string;
}

Person.init(
  {
    PersonID: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    FirstName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    LastName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Address: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    Phone: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    Email: {
      type: DataTypes.STRING,
      allowNull: true,
    }
  },
  {
    sequelize,
    modelName: 'Person',
    tableName: 'Person',
    timestamps: false
  }
);

export default Person;
