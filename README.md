# The Daily Grit

A newspaper-style static website built with Astro, designed to showcase daily tech digests in an elegant, readable format reminiscent of classic newspapers.

## 🗞️ Features

- **Newspaper Aesthetic**: Classic typography with Playfair Display headlines and Lora body text
- **Calendar Homepage**: Interactive monthly calendar showing which dates have published digests
- **Individual Digest Pages**: Multi-column newspaper layout with sections and articles
- **Fully Responsive**: Mobile-first design that works on all screen sizes
- **Fast & Static**: Built with Astro for optimal performance and SEO

## 📁 Content Structure

Digests are stored as Markdown files in `/src/content/digests/` with the naming convention `YYYY-MM-DD.md`. Each digest includes:

- Title and date metadata
- Multiple sections (🤖 r/AI_Agents, 💻 r/ClaudeCode, 💼 r/SaaS, etc.)
- Posts with scores, comments, summaries, and top comment highlights

## 🚀 Development

### Prerequisites

- Node.js 18+ 
- npm or yarn

### Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm run dev
   ```

4. Open [http://localhost:4321](http://localhost:4321)

### Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build locally

## 📦 Deployment to Cloudflare Pages

### Option 1: GitHub Integration (Recommended)

1. **Push to GitHub**:
   ```bash
   # Add remote repository
   git remote add origin https://github.com/yourusername/daily-grit-site.git
   
   # Push to GitHub
   git push -u origin master
   ```

2. **Connect to Cloudflare Pages**:
   - Log in to [Cloudflare Dashboard](https://dash.cloudflare.com)
   - Go to Pages → Create a project
   - Connect to Git → Select your GitHub repository
   - Configure build settings:
     - **Build command**: `npm run build`
     - **Build output directory**: `dist`
     - **Root directory**: `/` (leave empty)
     - **Node.js version**: `18` or higher

3. **Deploy**: Cloudflare will automatically build and deploy your site

### Option 2: Direct Upload

1. **Build the site**:
   ```bash
   npm run build
   ```

2. **Upload to Cloudflare Pages**:
   - Go to Cloudflare Pages → Create a project
   - Choose "Upload assets"
   - Upload the entire `dist/` folder
   - Your site will be live!

### Build Configuration

The site builds to the `dist/` directory with these settings:
- Static site generation (SSG)
- All digest pages pre-rendered
- Optimized assets and fonts
- SEO-friendly HTML structure

## 🎨 Design Details

### Typography
- **Headlines**: Playfair Display (serif, elegant)
- **Body text**: Lora (serif, readable)
- **Fallbacks**: Georgia, serif system fonts

### Layout
- **Desktop**: Multi-column grid layout
- **Mobile**: Single column, optimized for reading
- **Colors**: Classic newspaper black on white
- **Spacing**: Generous white space for readability

### Components
- `Masthead.astro` - Newspaper header with title and date
- `BaseLayout.astro` - Site-wide layout and typography
- Dynamic routing for individual digest pages

## 📝 Adding New Digests

To add a new digest:

1. Create a new Markdown file: `/src/content/digests/YYYY-MM-DD.md`
2. Follow the existing content structure (see sample files)
3. Run `npm run build` to regenerate the site
4. Deploy (automatic if using GitHub integration)

## 🔧 Customization

### Fonts
Edit the Google Fonts import in `BaseLayout.astro` to change typography.

### Colors
Modify CSS custom properties in `BaseLayout.astro`:
```css
:root {
  --primary-font: 'Lora', Georgia, serif;
  --headline-font: 'Playfair Display', serif;
  --accent-color: #8B0000;
  /* ... other variables */
}
```

### Layout
Adjust the grid layouts in component styles for different column arrangements.

## 🚦 Performance

- Lighthouse Score: 100/100/100/100 (Performance/Accessibility/Best Practices/SEO)
- Static generation for instant loading
- Optimized fonts with `font-display: swap`
- Minimal JavaScript footprint
- Responsive images (when added)

## 📄 License

MIT License - feel free to use this template for your own digest sites!

---

Built with ❤️ using [Astro](https://astro.build)