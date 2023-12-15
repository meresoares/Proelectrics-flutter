import { Request, Response } from 'express';
import { supplierService } from '../services/supplier.service';

class SupplierController {
  async create(req: Request, res: Response) {
    try {
      const supplier = await supplierService.create(req.body);
      res.status(201).json(supplier);
    } catch (error) {
      if (error instanceof Error) {
        res.status(500).json({ message: error.message });
      } else {
        res.status(500).json({ message: 'An unexpected error occurred.' });
      }
    }
  }

  async getAll(req: Request, res: Response) {
    try {
      const suppliers = await supplierService.getAll();
      res.status(200).json(suppliers);
    } catch (error) {
      if (error instanceof Error) {
        res.status(500).json({ message: error.message });
      } else {
        res.status(500).json({ message: 'An unexpected error occurred.' });
      }
    }
  }
  
    async getById(req: Request, res: Response) {
      try {
        const supplier = await supplierService.getById(req.params.id);
        if (!supplier) {
          res.status(404).json({ message: 'Supplier not found.' });
          return;
        }
        res.status(200).json(supplier);
      } catch (error) {
        if (error instanceof Error) {
          res.status(500).json({ message: error.message });
        } else {
          res.status(500).json({ message: 'An unexpected error occurred.' });
        }
      }
    }
  
    async update(req: Request, res: Response) {
      try {
        const updatedSupplier = await supplierService.update(req.params.id, req.body);
        if (!updatedSupplier) {
          res.status(404).json({ message: 'Supplier not found.' });
          return;
        }
        res.status(200).json(updatedSupplier);
      } catch (error) {
        if (error instanceof Error) {
          res.status(500).json({ message: error.message });
        } else {
          res.status(500).json({ message: 'An unexpected error occurred.' });
        }
      }
    }
  
    async delete(req: Request, res: Response) {
      try {
        const wasDeleted = await supplierService.delete(req.params.id);
        if (!wasDeleted) {
          res.status(404).json({ message: 'Supplier not found.' });
          return;
        }
        res.status(204).send();  // 204 No Content response for successful delete
      } catch (error) {
        if (error instanceof Error) {
          res.status(500).json({ message: error.message });
        } else {
          res.status(500).json({ message: 'An unexpected error occurred.' });
        }
      }
    }

}

export const supplierController = new SupplierController();
