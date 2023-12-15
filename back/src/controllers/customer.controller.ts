import { Request, Response } from 'express';
import { customerService } from '../services/customer.service';

class CustomerController {
  async create(req: Request, res: Response) {
    try {
      const customer = await customerService.create(req.body);
      res.status(201).json(customer);
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
      const customers = await customerService.getAll();
      res.status(200).json(customers);
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
        const customerId = req.params.id; // Asume que el ID del cliente se pasa como un parámetro en la URL
        const updatedCustomer = await customerService.update(customerId, req.body);
        res.status(200).json(updatedCustomer);
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
        const customerId = req.params.id; // Asume que el ID del cliente se pasa como un parámetro en la URL
        await customerService.delete(customerId);
        res.status(200).json({ message: 'Customer deleted successfully.' });
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
      const customer = await customerService.getById(req.params.id);
      if (customer) {
        res.status(200).json(customer);
      } else {
        res.status(404).json({ message: "Cliente no encontrado." });
      }
    } catch (error) {
      res.status(500).json({ message: "Error al obtener cliente." });
    }
  }
}


export const customerController = new CustomerController();
