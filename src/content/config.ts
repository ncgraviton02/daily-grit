import { defineCollection, z } from 'astro:content';

const digests = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.date(),
    sections: z.array(z.object({
      emoji: z.string(),
      name: z.string(),
      posts: z.array(z.object({
        title: z.string(),
        score: z.number(),
        comments: z.number(),
        summary: z.string(),
        topComments: z.array(z.string()),
        permalink: z.string().optional()
      }))
    }))
  })
});

export const collections = {
  digests
};