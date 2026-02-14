import { defineCollection, z } from 'astro:content';

const digests = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.date(),
    sections: z.array(z.object({
      icon: z.string(), // section identifier for CSS icon: "ai-agents", "claudecode", "saas", "digitalmarketing", "philosophy"
      name: z.string(),
      posts: z.array(z.object({
        title: z.string(),
        score: z.number(),
        comments: z.number(),
        summary: z.string(),
        permalink: z.string().optional(),
        topComments: z.array(z.object({
          author: z.string(),
          score: z.number().optional(),
          text: z.string()
        })).optional()
      }))
    }))
  })
});

export const collections = {
  digests
};
