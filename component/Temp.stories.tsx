import React from 'react';
import { type ComponentStory, type ComponentMeta } from '@storybook/react';
import Temp from './Temp';

export default {
  title: 'Components/Temp',
  component: Temp,
  decorators: [],
} as ComponentMeta<typeof Temp>;

const Template: ComponentStory<typeof Temp> = args => <Temp {...args} />;

export const Outlined = Template.bind({});
Outlined.args = {
  outlined: true,
};
