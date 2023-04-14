import React from 'react';
import { StoryObj, Meta } from '@storybook/react';
import Temp from './Temp';

// More on how to set up stories at: https://storybook.js.org/docs/react/writing-stories/introduction
const meta = {
  title: 'Components/Temp',
  component: Temp,
  decorators: [],
  args: {}
} satisfies Meta<typeof Temp>;

export default meta;

type Story = StoryObj<typeof meta>;

// More on writing stories with args: https://storybook.js.org/docs/react/writing-stories/args
export const Default: Story = {
  args: {},
};
