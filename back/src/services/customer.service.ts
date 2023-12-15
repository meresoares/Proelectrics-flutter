import Customer from '../models/customer.model';
import { ICustomer } from '../interfaces/customer.interfaces';

class CustomerService {
  async create(data: Partial<ICustomer>): Promise<ICustomer> {
    try {
      return await Customer.create(data);
    } catch (error) {
      if (error instanceof Error) {
        throw new Error(`Error al crear el cliente: ${error.message}`);
      } else {
        throw new Error('Error desconocido al crear el cliente.');
      }
    }
  }

  async getAll(): Promise<ICustomer[]> {
    try {
      return await Customer.findAll();
    } catch (error) {
      if (error instanceof Error) {
        throw new Error(`Error al obtener todos los clientes: ${error.message}`);
      } else {
        throw new Error('Error desconocido al obtener los clientes.');
      }
    }
  }

  async update(customerId: string, customerData: any): Promise<ICustomer | null> {
    try {
      const customer = await Customer.findByPk(customerId);
      if (!customer) {
        throw new Error('Cliente no encontrado');
      }
      await customer.update(customerData);
      return customer;
    } catch (error) {
      if (error instanceof Error) {
        throw new Error(`Error al actualizar el cliente: ${error.message}`);
      } else {
        throw new Error('Error desconocido al actualizar el cliente.');
      }
    }
  }

  async delete(customerId: string): Promise<void> {
    try {
      const customer = await Customer.findByPk(customerId);
      if (!customer) {
        throw new Error('Cliente no encontrado');
      }
      await customer.destroy();
    } catch (error) {
      if (error instanceof Error) {
        throw new Error(`Error al eliminar el cliente: ${error.message}`);
      } else {
        throw new Error('Error desconocido al eliminar el cliente.');
      }
    }
  }

  async getById(customerId: string | number): Promise<ICustomer | null> {
    return Customer.findByPk(customerId);
  }

}

export const customerService = new CustomerService();
