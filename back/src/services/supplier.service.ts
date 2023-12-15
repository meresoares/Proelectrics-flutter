import Supplier from '../models/supplier.model';
import { ISupplier } from '../interfaces/supplier.interfaces';

class SupplierService {
  async create(data: Partial<ISupplier>): Promise<ISupplier> {
    return Supplier.create(data);
  }

  async getAll(): Promise<ISupplier[]> {
    return Supplier.findAll();
  }

  async getById(id: string): Promise<ISupplier | null> {
    try {
      return await Supplier.findByPk(id);
    } catch (error: any) {
      throw new Error('Error al buscar el proveedor por ID: ' + error.message);
    }
  }

  async update(id: string, data: Partial<ISupplier>): Promise<ISupplier | null> {
    try {
      const supplier = await Supplier.findByPk(id);
      if (!supplier) {
        throw new Error('No se encontró el proveedor con el ID especificado.');
      }
      await supplier.update(data);
      return supplier;
    } catch (error: any) {
      throw new Error('Error al actualizar el proveedor: ' + error.message);
    }
  }

  async delete(id: string): Promise<boolean> {
    try {
      const result = await Supplier.destroy({ where: { SupplierID: id } });
      if (result === 0) {
        throw new Error('No se encontró el proveedor con el ID especificado para eliminar.');
      }
      return true;
    } catch (error: any) {
      throw new Error('Error al eliminar el proveedor: ' + error.message);
    }
  }
}

export const supplierService = new SupplierService();
