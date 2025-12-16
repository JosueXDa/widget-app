# 📱 Forex News App - Flutter

Una aplicación móvil Flutter profesional para consultar noticias económicas y eventos del calendario financiero desde la API Forex Factory.

**Desarrollada con:**
- ✅ Patrón MVC (Model-View-Controller)
- ✅ Principios SOLID
- ✅ Atomic Design
- ✅ Provider para estado
- ✅ Inyección de dependencias
- ✅ Arquitectura limpia

---

## 🎯 Características Principales

- 📊 **Consumo de API**: Integración con Forex Factory Scraper API
- 🎨 **Atomic Design**: Componentes reutilizables y consistentes
- 🔄 **Gestión de Estado**: Provider para estado reactivo
- 🌙 **Tema Dinámico**: Soporte para tema claro y oscuro
- 📅 **Selector de Fechas**: Filtra eventos por fecha
- ⚠️ **Indicadores de Impacto**: Visualización de alto/medio/bajo impacto
- 🔐 **Manejo Seguro de Errores**: Try-catch y validación
- 📱 **Responsiva**: Interfaz adaptable a diferentes tamaños

---

## 🚀 Inicio Rápido

### Requisitos
- Flutter 3.9.2 o superior
- Dart 3.9.2 o superior
- API Key de RapidAPI

### Instalación

1. **Instalar dependencias**
```bash
flutter pub get
```

2. **Configurar API Key**

Abre `lib/config/constants.dart`:
```dart
static const String rapidApiKey = 'TU_CLAVE_AQUI';
```

3. **Ejecutar app**
```bash
flutter run
```

---

## 📋 Documentación

- **ARCHITECTURE.md** - Explicación completa de la arquitectura MVC y SOLID
- **QUICKSTART.md** - Guía rápida de configuración y desarrollo
- **API_CONFIG_EXAMPLE.dart** - Ejemplo de configuración de API

---

## 🏗️ Estructura del Proyecto

El proyecto está organizado en capas siguiendo MVC:

```
lib/
├── config/           # Configuración global
├── data/            # Capa de datos (API, Repositories)
├── domain/          # Capa de dominio (Models, Use Cases)
├── presentation/    # Capa de presentación (UI, Providers)
└── core/            # Utilidades compartidas
```

---

## 💡 Principios Implementados

✅ **SOLID** - Diseño orientado a objetos robusto
✅ **MVC** - Separación clara de responsabilidades
✅ **DI** - Inyección de dependencias
✅ **Atomic Design** - Componentes reutilizables

---

Para más información, consulta la documentación completa en los archivos markdown incluidos.
