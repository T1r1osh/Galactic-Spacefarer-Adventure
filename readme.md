# Galactic Spacefarer

A SAP Cloud Application Programming (CAP) project for managing spacefarers across the galaxy. This application allows administrators to track spacefarers, their departments, positions, and various space-related attributes.

## Features

- **Spacefarer Management**: Track spacefarers with their personal details, planet of origin, spacesuit color, and special skills
- **Department & Position Tracking**: Organize spacefarers by departments and hierarchical positions
- **Role-based Access Control**: Different permissions for users from different planets
- **SAP Fiori UI**: Modern web interface built with SAPUI5 and Fiori Elements
- **Draft-enabled**: Support for draft functionality in the Spacefarer entity

## Architecture

- `db/` - Domain models and initial data
- `srv/` - Service definitions and business logic
- `app/` - UI applications (Fiori Elements)

## Authentication

The application includes basic authentication with predefined users:

- **admin** (password: admin) - Full access across all planets
- **mars** (password: mars) - Access to Mars-based spacefarers only
- **earth** (password: earth) - Access to Earth-based spacefarers only

## Getting Started

### Prerequisites

- Node.js (v18 or higher)
- npm or yarn

### Installation

1. Clone the repository:

2. Install dependencies:
   ```bash
   npm install
   ```

### Running the Application

1. Start the CAP server in watch mode:

   ```bash
   npm run watch-galacticlistreport
   ```

   Or use the VS Code task:
   - Open Command Palette (Ctrl+Shift+P)
   - Run Task > cds watch

2. The application will open automatically in your browser at:
   - Fiori App: `http://localhost:4004/galacticlistreport/index.html`
   - Service endpoints: `http://localhost:4004/spacefarer/`
